
# Create EC2 Instance

Quickly create an EC2 instance with SSH access using Terraform via global shortcuts.

![Demo](demo.gif)

Create an EC2 instance with SSH access from your IP (or custom Terraform) using global shortcuts.

When setup, all that's needed to create a new instance is `create-ec2`, login with `ec2-login` and destroy with `destroy-ec2`.

Instances can be launched using AWS cli commands however, having this setup in Terraform allows me to easily destroy the instance and security group when I'm finished, without having to find the resource ids for deletion.

You could assign the `create-ec2` command as a [hotkey](#Hotkey) to create a new instance even quicker.

# Setup

Clone and open repo:
```
git clone https://github.com/tkav/create-ec2-instance && cd create-ec2-instance
```

Edit `variables.sh` with default values:
```
nano variables.sh
```

Set execute permissions on scripts:
```
sudo chmod 700 create-ec2.sh && chmod 700 ec2-login.sh && chmod 700 destroy-ec2.sh
```

Create a new alias to execute the scripts to either `~/.bashrc`:
```
echo alias create-ec2=$PWD/create-ec2.sh >> ~/.bashrc
echo alias ec2-login=$PWD/ec2-login.sh >> ~/.bashrc
echo alias destroy-ec2=$PWD/destroy-ec2.sh >> ~/.bashrc
```
or `~/.zshrc`:
```
echo alias create-ec2=$PWD/create-ec2.sh >> ~/.zshrc
echo alias ec2-login=$PWD/ec2-login.sh >> ~/.zshrc
echo alias destroy-ec2=$PWD/destroy-ec2.sh >> ~/.zshrc
```

Open a new terminal. Now `create-ec2`, `ec2-login` and `destroy-ec2` can be run globally in your terminal.

### Hotkey

You could make this one step quicker again by assigning a hotkey to run the `create-ec2` command.

On OSX:

- Open Automator
- `File > Open`
- Select `Create EC2` in this repo's directory
- Modify the path to your script
- Save

- Open `System Preferences > Keyboard > Shortcuts > Services`
- Find and click on `Create EC2`
- Set a keyboard shortcut, such as `^⌘i`

Now you can create an instance using the shortcut. 

# Usage

## Commands

After following the setup instructions above, run these from anywhere in your terminal.

<br />

### `create-ec2`

Default values will be presented. Hit enter to confirm default values or set a new value.

Input Values:

`project_name` - Name of your instance and Project tag on resources

`key_name` - Name of your SSH key-pair (that already exists on AWS)

`ami` - AMI to use for EC2 instance.

`instance_size` - EC2 Instance type

Optionally run with an argument to use default values (eg. `create-ec2 1`).

Executes Terraform to creates:
- 1 x EC2 instance with the specified AMI, instance size and key-pair name

- 1 x Security group will created and assigned to the EC2 instance

    - SSH (port 22) access from your IP Address is allowed

<br />

### `ec2-login`

Attempts to SSH into the newly created user with the public DNS and key name specified.
SSH Key is expected at `~/.ssh/key_name.pem`.
Login name is expected to be `ec2-user`.

<br />

### `destroy_ec2`

This will not prompt for confirmation.

<br />

# Requirements

- AWS credentials set in terminal
- Terraform
- jq (For SSH command update in [`ec2-login.sh`](ec2-login.sh))
- Key name must already exist

# Notes

The same state file is used each time `create-ec2` is run. Without modifications you cannot run `create-ec2` twice and have two separate instances.