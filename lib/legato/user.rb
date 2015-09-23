module Legato
  class User
    attr_accessor :access_token, :api_key

    def initialize(token, api_key = nil)
      self.access_token = token
      self.api_key = api_key
    end

    # TODO: refactor into request object again
    def request(query)
      Request.new(self, query).response
    end

    # Management Associations

    # All the `Account` records available to this user
    def accounts
      Management::Account.all(self)
    end

    def account_summary
      Management::AccountSummary.all(self)
    end

    # All the `WebProperty` records available to this user
    def web_properties
      Management::WebProperty.all(self)
    end

    # All the `Profile` records available to this user
    def profiles
      Management::Profile.all(self)
    end

    # All the `Segment` records available to this user
    def segments
      Management::Segment.all(self)
    end

    # All the `Goal` records available to this user
    def goals
      Management::Goal.all(self)
    end
  end
end
