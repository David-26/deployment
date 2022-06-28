# README

Containers in this Repository

* Kali Linux with Remote Desktop
* YouTrack

# Setup Containers

## .env

To initialise the secrets used by this docker deployment copy .env.example to .env and modify secrets values.

```
cp .env.example .env
```

## Docker

| Command | Description |
| ------- | ----------- |
| `docker compose build` | Builds the images required for the docker deployment |
| `docker compose create` | Creates the docker containers |
| `docker compose start` | Starts the docker containers |
| `docker compose down` | Destroys all docker containers related to the deployment |

# Setup Applications

## YouTrack

1. Run the command `docker exec -it youtrack cat /opt/youtrack/conf/internal/services/configurationWizard/wizard_token.txt` to get the wizard token.
2. Access the YouTrack application URL [http://localhost:8080](http://localhost:8080)
3. Wait for the 'warming up' action to complete.
4. On the "Attention administrators" page enter the wizard token acquired during step, and select **Log In**.
5. When given the option to Setup or Upgrade, select **Upgrade**.
6. On Select Update Source page, select **Select**.
7. In the Select Source modal, select **init.zip** and **Select**.
8. Select **Next**.
9. On Confirm Settings page, select **Next**.
10. On Confirm Licence page, select **Finish**.
11. After setup is complete, login using the credentials.

# Access Applications

## YouTrack

After importing the init.zip the default credentials are

* Username: admin
* Password: admin