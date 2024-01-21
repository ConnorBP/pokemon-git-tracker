# pokemon-git-tracker
Tracks local github commits and notifes a shared group channel about the changes with a fun random pokemon attachment.

## things we wawnna use for the OS class project:

 - Rust
 - Shell scripts
 - Lambda (maybe)
 - DB
 - Terraform (setup db/lambda infra) (maybe)

## possible ideas:

pokemon git tracker: read local git changes, and fire events that communicate with a lambda which notifies other group members of changes in discord. Have a DB that with a audit table to save events and more tables maybe. Add some GPT to analyze the structure the event text as a discord bot.

## Documentation

The documentation is divided into several sections:
- [Installation](#installation)
   - [AWS CLI](#aws-cli)

## Installation

### AWS CLI

#### Prerequisites
- You should have an AWS account and have been provided with the necessary access keys (Access Key ID and Secret Access Key).

#### Step 1: Install the AWS CLI
1. **Download the AWS CLI**: 
   - For Windows/Linux/MacOS: Download the installer from [AWS CLI official page](https://aws.amazon.com/cli/).
   - For macOS using homebrew: Run the following command in your terminal:
     ```
     brew install awscli
     ```
   - For other installation methods, visit the [AWS CLI installation guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html).

2. **Verify the installation**: 
   - Open your terminal or command prompt and run `aws --version`. You should see the version number of the CLI.

#### Step 2: Configure the AWS CLI
1. **Run the configure command**:
   - In your terminal or command prompt, run `aws configure`. This command will prompt you to enter the AWS Access Key ID, Secret Access Key, AWS Region, and output format.

2. **Enter your AWS credentials**:
   - **AWS Access Key ID**: Enter the Access Key ID provided to you.
   - **AWS Secret Access Key**: Enter the Secret Access Key.
   - **Default region name**: Enter your preferred AWS region (e.g., `us-east-2`).
   - **Default output format**: You can leave this blank or set it to `json`.

3. **Verify the configuration**:
   - Run `aws s3 ls` or `aws ec2 describe-instances`. You should not receive any errors.

#### Additional Tips
- **Multiple Profiles**: If you need to use multiple AWS accounts, you can configure additional profiles using `aws configure --profile <profile_name>`.
- **Help & Resources**: For more detailed instructions and troubleshooting, visit the [AWS CLI User Guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html).

