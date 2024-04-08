use lambda_http::{
    http::{Method, StatusCode},
    Body, Error, Request, Response,
};
use rand::Rng;
use serde::{Deserialize, Serialize};

use crate::{
    handle_not_found,
    webhook::{execute_webhook, ExecuteWebhookPayload, Webhook},
};

#[derive(Debug, Serialize, Deserialize)]
pub struct Commit {
    pub hash: String,
    pub url: String,
    pub author: String,
    pub message: String,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Changes {
    pub added: i32,
    pub removed: i32,
    pub modified: i32,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct CreateActionPayload {
    pub repo: String,
    pub branch: String,
    pub date: String,
    pub commit: Commit,
    pub changes: Changes,
    pub webhook: Webhook,
}

pub async fn action_controller(event: Request) -> Result<Response<Body>, Error> {
    let method = event.method();

    match method {
        &Method::POST => create_action(event).await,
        _ => handle_not_found().await,
    }
}

async fn create_action(event: Request) -> Result<Response<Body>, Error> {
    let pokemon_id = rand::thread_rng().gen_range(1..=1025);

    let body: CreateActionPayload =
        serde_json::from_slice(event.body()).expect("Unable to parse body");

    execute_webhook(ExecuteWebhookPayload {
        action: CreateActionPayload {
            repo: body.repo,
            branch: body.branch,
            date: body.date,
            commit: body.commit,
            changes: body.changes,
            webhook: body.webhook,
        },
        pokemon_id,
    })
    .await?;

    let res = Response::builder()
        .status(StatusCode::OK)
        .header("Content-Type", "application/json")
        .body("Action created successfully".into())
        .map_err(Box::new)?;

    Ok(res)
}
