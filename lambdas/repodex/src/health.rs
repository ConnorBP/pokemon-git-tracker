use lambda_http::{
    http::{Method, StatusCode},
    Body, Error, Request, Response,
};
use serde_json::json;

use crate::handle_not_found;

pub async fn health_controller(event: Request) -> Result<Response<Body>, Error> {
    let method = event.method();

    match method {
        &Method::GET => get_health().await,
        _ => handle_not_found().await,
    }
}

pub async fn get_health() -> Result<Response<Body>, Error> {
    let payload = json!({
        "message": "Repodex is healthy.",
    });

    let res = Response::builder()
        .status(StatusCode::OK)
        .header("content-type", "application/json")
        .body(payload.to_string().into())
        .map_err(Box::new)?;

    Ok(res)
}
