use lambda_http::{
    http::{Method, StatusCode},
    Body, Error, Request, Response,
};
use serde_json::json;

use crate::handle_not_found;

pub async fn action_controller(event: Request) -> Result<Response<Body>, Error> {
    let method = event.method();

    match method {
        &Method::POST => create_action(event).await,
        _ => handle_not_found().await,
    }
}

async fn create_action(event: Request) -> Result<Response<Body>, Error> {
    let pokemon_image = get_random_pokemon().await.unwrap();

    let body = event.body();
    println!("Body: {:?}", body);

    let payload = json!({
        "pokemon_image": pokemon_image,
        // "body": body,
    });

    let res = Response::builder()
        .status(StatusCode::OK)
        .header("Content-Type", "application/json")
        .body(payload.to_string().into())
        .map_err(Box::new)?;

    Ok(res)
}

async fn get_random_pokemon() -> Result<String, Error> {
    let rustemon_client = rustemon::client::RustemonClient::default();
    let pokemon = rustemon::pokemon::pokemon::get_by_id(1, &rustemon_client).await;
    let pokemon_image = pokemon.unwrap().sprites.front_default.unwrap();
    Ok(pokemon_image)
}
