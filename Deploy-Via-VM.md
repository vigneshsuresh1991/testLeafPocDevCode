## Steps to Deploy Pos app in Ubuntu VM

1. Fork repo to your account -> https://github.com/mohan-balakrishnan/Testleaf-pos
2. Go to Testleaf-pos/src/api/apiBuilder.js -> modify your server ip
3. Run following commands to deploy app

```bash
sudo apt update
sudo apt install -y curl dirmngr apt-transport-https lsb-release ca-certificates

curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs
node -v
sudo npm install -g yarn

git clone <YOUR-GITHUB-REPO-URL>
cd Testleaf-pos

npm install
yarn install
nohup sudo yarn dev:web > /dev/null 2>&1 &

cd api
npm install
yarn install
nohup sudo yarn dev:api > /dev/null 2>&1 &
```

## To run the current code in Development Mode

1. Run `yarn` to install all the dependencies in the root and also in the `api` folder.
2. Run `yarn dev:web` in one terminal session to start the web app in `localhost`
3. Run `yarn dev:api` in another terminal session to start the backend API in `localhost:3500`
4. Navigate to `http://localhost` eg: `http://publicip` and use `admin` as username & password to see the dashboard.
