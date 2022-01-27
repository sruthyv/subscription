# Broadcaster

Broadcasting of handlers

## Getting Started

1. Clone the repo

  ```
  $ git clone https://github.com/sruthyv/subscription.git
  $ cd subscription
  ```

2. Install dependencies

  ```
  $ bundle install
  ```

4. Run application locally
  ```
  $ irb
  > require './broadcaster.rb'
  ```
5. Subscribe and broadcast
  ```
  > block = -> (*args) do
  >   puts args.sum
  > end
  > B = Broadcaster.new()
  > B.subscribe(&block)
  > B.broadcast(1, 2, 3, 4)
  ```

5. Unsubscribe
  ```
  > block = -> (*args) do
  >   puts args.sum
  > end
  > B = Broadcaster.new()
  > B.subscribe(&block)
  > B.unsubscribe(&block)
  ```