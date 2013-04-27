require 'spec_helper'

describe "Posts" do
  describe "GET /posts" do
    it "displays some posts" do
    	visit posts_path
    	page.should have_content "New post"
    end
  end
end
