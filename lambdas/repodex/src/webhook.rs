use lambda_http::{
    http::{Method, StatusCode},
    Body, Error, Request, Response,
};
use serde::{Deserialize, Serialize};
use serde_json::json;

use crate::{action::CreateActionPayload, handle_not_found};

pub async fn webhook_controller(event: Request) -> Result<Response<Body>, Error> {
    let method = event.method();

    match method {
        &Method::POST => create_webhook(event).await,
        _ => handle_not_found().await,
    }
}

async fn create_webhook(_event: Request) -> Result<Response<Body>, Error> {
    todo!()
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Webhook {
    pub id: String,
    pub token: String,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct ExecuteWebhookPayload {
    pub action: CreateActionPayload,
    pub pokemon_id: i32,
}

pub async fn execute_webhook(webhook_payload: ExecuteWebhookPayload) -> Result<(), Error> {
    let payload = json!(
    {
      "content": null,
      "embeds": [
        {
          "title": "🌟 Project Update Detected! 🌟",
          "description": format!("Repo: {}\nBranch: {}\nDate: {}", webhook_payload.action.repo, webhook_payload.action.branch, webhook_payload.action.date),
          "url": "https://github.com",
          "color": 0,
          "fields": [
            {
              "name": "Commiter",
              "value": format!("{} - [View Commit]({})", webhook_payload.action.commit.author, webhook_payload.action.commit.url),
              "inline": true
            },
            {
              "name": "🔍 Changes:",
              "value": format!("Added: {}\nRemoved: {}\nModified: {}", webhook_payload.action.changes.added, webhook_payload.action.changes.removed, webhook_payload.action.changes.modified),
            }
          ],
          "footer": {
            "text": "Keep up the great work, team! Let's make our project the very best, like no one ever was! 🌈"
          },
          "image": {
            "url": format!("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/{}.png", webhook_payload.pokemon_id)
          },
          "thumbnail": {
            "url": format!("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/{}.png", webhook_payload.pokemon_id)
          }
        }
      ],
      "attachments": []
    }
    );

    let client = reqwest::Client::new();
    let _res = client
        .post(format!(
            "https://discord.com/api/webhooks/{}/{}",
            webhook_payload.action.webhook.id, webhook_payload.action.webhook.token
        ))
        .header(reqwest::header::CONTENT_TYPE, "application/json")
        .body(payload.to_string())
        .send()
        .await;

    Ok(())
}
