require "rails_helper"

RSpec.describe "EmojisController", type: :request do
  describe "GET #new" do
    it "renders the :new template" do
      get new_emoji_path
      expect(response).to render_template :new
    end
  end
end
