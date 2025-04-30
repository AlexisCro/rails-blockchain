# Rails Blockchain
## Stack
* Ruby on Rails v7.1
* SQLite3
* Redis

## Description
This is a simple Ruby on Rails application that implements a basic blockchain. 
It allows users to create blocks, view the blockchain.

## Installation
To run this application locally, follow these steps:
Install ruby on your environment. You can use a version manager like [rbenv](https://github.com/rbenv/rbenv) or [rvm](https://rvm.io/) 
to manage your Ruby versions.

Then clone the repository and go to the project directory. After that, run the following commands:

```bash
bundle install
```

The dependencies will be installed (Rails, Redis, ...).

After that you should be able to launch the server. 
```bash
rails server # or rails s
```

## Play with the blockchain
### Create a block
This project, as an API, permit you to create a block from the URL. 
By default at the start of the project there's no block in the chain. So that, when you'll start the server and go to 
the URL `http://localhost:3000`, you should see no data.

But you can create a block by going to the URL `http://localhost:3000/blocks/mine/{{data}}`.

For example : 
To create a block, I will use these URL : 
- `http://localhost:3000/blocks/mine/{'project': 'rails-blockchain'}`
If everything is ok, so you should see your block. 

### View the blockchain
To view the blockchain, you can go to the URL `http://localhost:3000/blocks` or `http://localhost:3000` as the project root is the block index.
