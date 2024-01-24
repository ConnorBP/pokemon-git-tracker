use lambda_runtime::{service_fn, Error, LambdaEvent};
use serde_json::{json, Value};

#[tokio::main]
async fn main() -> Result<(), Error> {
    lambda_runtime::run(service_fn(run_lambda)).await
}

fn say_hello(name: Option<&str>) -> String {
    let name = name.unwrap_or("stranger");
    format!("Hello, {name}!")
}

async fn run_lambda(event: LambdaEvent<Value>) -> Result<Value, Error> {
    let (event, _context) = event.into_parts();
    tracing::info!("event: {:?}", event);

    let name = event["name"].as_str();
    let result = say_hello(name);
    Ok(json!(result))
}
