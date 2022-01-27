require 'spec_helper'
require './broadcaster'

RSpec.describe Broadcaster do
  describe '#subscribe' do
    let(:broadcaster) { Broadcaster.new() }

    context 'when a block is subscribed' do
      let(:block) { -> (*args) { puts args.sum } }

      it 'block will be added to the list of handlers' do
        handlers = broadcaster.instance_variable_get(:@handlers)
        expect(handlers.count).to eq(0)
        broadcaster.subscribe(&block)
        expect(handlers.count).to eq(1)
      end
    end

    context 'when more than one blocks are subscribed' do
      let(:block1) { -> (*args) { puts args.sum } }
      let(:block2) { -> (*args) { puts args } }

      it 'all blocks will be added to the list of handlers' do
        handlers = broadcaster.instance_variable_get(:@handlers)
        expect(handlers.count).to eq(0)
        broadcaster.subscribe(&block1)
        broadcaster.subscribe(&block2)
        expect(handlers.count).to eq(2)
      end
    end

    context 'when a block is unsubscribed' do
      let(:block) { -> (*args) { puts args.sum } }

      it 'block will be removed from the list of handlers' do
        handlers = broadcaster.instance_variable_get(:@handlers)
        broadcaster.subscribe(&block)
        expect(handlers.count).to eq(1)
        broadcaster.unsubscribe(&block)
        expect(handlers.count).to eq(0)
      end
    end

    context 'when more than one blocks are unsubscribed' do
      let(:block1) { -> (*args) { puts args.sum } }
      let(:block2) { -> (*args) { puts args } }

      it 'all blocks will be removed from the list of handlers' do
        handlers = broadcaster.instance_variable_get(:@handlers)
        broadcaster.subscribe(&block1)
        broadcaster.subscribe(&block2)
        expect(handlers.count).to eq(2)
        broadcaster.unsubscribe(&block1)
        broadcaster.unsubscribe(&block2)
        expect(handlers.count).to eq(0)
      end
    end

    context 'when broadcast is called' do
      let(:block) { -> (*args) { puts args.sum } }

      it 'block will get executed taking arguments' do
        broadcaster.subscribe(&block)
        expect(broadcaster.broadcast(1, 2, 3, 4)).to eq('broadcasted')
      end
    end
  end
end
