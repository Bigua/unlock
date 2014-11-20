RSpec.configure do |config|
  def get_user(name)
    @users ||= {}
    @users[name] ||= User.create!(email: "#{name}@bar.com", password: 'test123', password_confirmation: 'test123', locale: 'en', name: name.humanize)
    @users[name].reload
  end

  def get_initiative(permalink, user)
    @initiatives ||= {}
    @initiatives[permalink] ||= Initiative.create!(name: permalink.humanize, user: user, permalink: permalink)
    @initiatives[permalink].reload
  end

  def get_contribution(state)
    @contributions ||= {}
    @contributions[state] ||= Contribution.create!(user: visitor_user, initiative: unlock_initiative, value: 10, state: state, gateway_state: 'production', gateway: production_gateway)
    @contributions[state].reload
  end

  def get_gateway(state)
    @gateways ||= {}
    @gateways[state] ||= Gateway.create!(initiative: unlock_initiative, module_name: "#{state.capitalize}Gateway", state: state)
    @gateways[state].reload
  end

  def the_creator_user
    get_user('the_creator')
  end

  def visitor_user
    get_user('visitor')
  end

  def unlock_initiative
    get_initiative('unlock', the_creator_user)
  end

  def pending_contribution()    get_contribution('pending')   end
  def active_contribution()     get_contribution('active')    end
  def suspended_contribution()  get_contribution('suspended') end

  def draft_gateway()       get_gateway('draft')      end
  def sandbox_gateway()     get_gateway('sandbox')    end
  def production_gateway()  get_gateway('production') end

  config.before(:all) do
    # Insert all data needed for tests
    the_creator_user
    visitor_user
    unlock_initiative
    pending_contribution
    active_contribution
    suspended_contribution
    draft_gateway
    sandbox_gateway
    production_gateway
  end

  config.after(:all) do
    %w(users contributions gateways initiatives).each do |table|
      ActiveRecord::Base.connection.execute "TRUNCATE #{table} CASCADE"
    end
  end
end
