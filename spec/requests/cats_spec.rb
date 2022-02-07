require 'rails_helper'

RSpec.describe "Cats", type: :request do
describe "GET /index" do
    it "gets a list of cats" do
      Cat.create(
        name: 'Felix',
        age: 2,
        enjoys: 'Walks in the park',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )
      # Make a request
      get '/cats'

      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end
describe "POST /create" do
    it "creates a cat" do
      # The params we are going to send with the request
      cat_params = {
        cat: {
          name: 'Buster',
          age: 4,
          enjoys: 'Meow Mix, and plenty of sunshine.',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
     # Send the request to the server
    post '/cats', params: cat_params

    # Assure that we get a success back
    expect(response).to have_http_status(200)

    # Look up the cat we expect to be created in the db
    cat = Cat.first

    # Assure that the created cat has the correct attributes
    expect(cat.name).to eq 'Buster'
  end
end

describe "PATCH /update" do
    it "updates a cat" do
      # The params we are going to send with the request
      cat_params = {
        cat: {
          name: 'Buster',
          age: 4,
          enjoys: 'Meow Mix, and plenty of sunshine.',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
     # Send the request to the server
    post '/cats', params: cat_params
    cat = Cat.first

    #let's update the cat
    updated_cat_params = {
      cat: {
        name: 'Duster',
        age: 5,
        enjoys: 'Meow Mix, and plenty of sunshine.',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      }
    }

    patch "/cats/#{cat.id}", params: updated_cat_params
    # Assure that we get a success back

    updated_cat = Cat.find(cat.id)
    #assert response code
    expect(response).to have_http_status(200)
    #assert payload
    expect(updated_cat.name).to eq 'Duster'
    expect(updated_cat.age).to eq 5
  end
end

describe "DELETE /destroy" do
    it 'deletes a cat' do
      # create a cat
      cat_params = {
        cat: {
          name: 'Felix',
          age: 4,
          enjoys: 'Walks in the park.'
        }
      }
      post '/cats', params: cat_params
      cat = Cat.first
      delete "/cats/#{cat.id}"

      # asserting against the response code
      expect(response).to have_http_status(200)

      cats = Cat.all
      # asserting against the payload
      expect(cats).to be_empty
    end
  end
end
