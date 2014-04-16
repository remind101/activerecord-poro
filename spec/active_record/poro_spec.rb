require 'spec_helper'

describe ActiveRecord::Poro do
  let(:user) { User.create }
  let(:message) { Message.create }
  let(:activity_class) {
    Class.new do
      include Virtus.model
      include ActiveRecord::Poro

      def initialize(*args)
        @association_cache = {}
        super
      end
    end
  }

  describe '#belongs_to' do
    describe 'polymorphic' do
      let(:activity) { activity_class.new(creator_id: user.id, creator_type: 'User') }

      before do
        activity_class.class_eval do
          belongs_to :creator, polymorphic: true

          attribute :creator_id, Integer
          attribute :creator_type, String
        end
      end

      it 'loads the association' do
        expect(activity.creator).to eq user
      end

      it 'allows the association to be eager loaded' do
        ActiveRecord::Associations::Preloader.new(activity, [:creator]).run
        expect(activity.association(:creator)).to be_loaded
        expect(activity.association(:creator).target).to eq user
      end
    end
  end
end
