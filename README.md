# Mojo Docker Setup

Mojo is a package manager and virtual environment manager that currently supports only Ubuntu. To run Mojo on other systems, such as macOS or Windows, we use Docker to create a containerized Ubuntu environment.

## Prerequisites

- Ensure Docker is installed on your system. You can download and install Docker from [https://www.docker.com/get-started](https://www.docker.com/get-started).
- Install Visual Studio Code (VS Code) from [https://code.visualstudio.com/](https://code.visualstudio.com/).
- Install the "Remote - Containers" extension in VS Code, which allows you to connect to a Docker container and use it as a development environment.

## Building the Docker Image

To get started, first build the Docker image using the provided Dockerfile.

Run the following command in the directory where your Dockerfile is located:

```sh
DOCKER_BUILDKIT=1 docker build -t vitali87/mojo .
```

## Running the Container

Once the Docker image is built, you can run the container with your current directory mounted to `/app` inside the container. This allows you to work with files from your local machine within the Docker environment.

Use the following command to start the container:

```sh
docker run -it --rm -v "$(pwd)":/app -w /app --name mojo-container vitali87/mojo
```

### Explanation of the Command

- `-it`: Runs the container in interactive mode with a terminal, allowing you to interact with the shell.
- `--rm`: Removes the container once you exit, to keep things clean.
- `-v "$(pwd)":/app`: Mounts your current directory (`$(pwd)`) to `/app` inside the container.
- `-w /app`: Sets `/app` as the working directory inside the container.
- `--name mojo-container`: Names the container "mojo-container" for easier identification.
- `vitali87/mojo`: The name of the Docker image.

Once the container starts, you will be in an interactive bash session, with your current directory available at `/app`.

## Connecting to the Container Using VS Code

To connect to the Docker container using VS Code, follow these steps:

1. Start the container using the command mentioned above, ensuring that the container is running.
2. Open VS Code.
3. Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on macOS) to open the Command Palette.
4. Type "Remote-Containers: Attach to Running Container" and select it.
5. You will see a list of running containers. Select `mojo-container`.
6. VS Code will now connect to the container, and you can start developing inside it.

## Updating Mojo

To update Mojo within the Docker container, simply run:

```sh
magic self-update
```

This ensures you have the latest version of Mojo with all the latest features and fixes.

## Enabling Auto-Completion for Magic

To enable auto-completion for Magic commands within the Docker container, run the following commands:

```sh
BASHRC=$( [ -f "$HOME/.bash_profile" ] && echo "$HOME/.bash_profile" || echo "$HOME/.bashrc" )
echo 'eval "$(magic completion --shell bash)"' >> "$BASHRC"
source "$BASHRC"
```

This will add auto-completion for Magic commands, making your experience more convenient.