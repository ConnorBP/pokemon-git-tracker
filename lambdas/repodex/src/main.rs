mod action;
mod health;
mod webhook;

use lambda_http::{http::StatusCode, run, service_fn, tracing, Body, Error, Request, Response};
use serde_json::json;

async fn router(event: Request) -> Result<Response<Body>, Error> {
    let path = event.uri().path();
    match path {
        "/health" => health::health_controller(event).await,
        "/action" => action::action_controller(event).await,
        "/webhook" => webhook::webhook_controller(event).await,
        _ => handle_not_found().await,
    }
}

pub async fn handle_not_found() -> Result<Response<Body>, Error> {
    let payload = json!({
        "message": "The requested resource was not found."
    });

    let res = Response::builder()
        .status(StatusCode::NOT_FOUND)
        .header("content-type", "application/json")
        .body(payload.to_string().into())
        .map_err(Box::new)?;

    Ok(res)
}

#[tokio::main]
async fn main() -> Result<(), Error> {
    tracing::init_default_subscriber();

    run(service_fn(router)).await
}
