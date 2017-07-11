require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
  # pending "add some examples to (or delete) #{__FILE__}"


  # Each example (it) is run in isolation of others.
  # terefore each example will needs its own @category created
   # and then @product initialized with that category
  before :each do
    @cat1 = Category.create(name: 'Apparel')

    ## PRODUCTS

    @product1 = @cat1.products.create({
      name:  'Test',
      description: "Faker::Hipster.paragraph(4)",
      quantity: 10,
      price: 64.99
    })

  end

  # happy path
  context "Name:" do

    it "Should verify the presence of product name" do
      expect(@product1.name.present?).to eq(true)
  end

  # sad path
    it "Product without a name should log error" do
      @category = Category.create(name: 'Apparel')
        @product = @categ1.product.create({
          name: nil,
          description: "Test",
          quantity: 10,
          price: 64.99
        })
        expect(@product.errors.full_message.present?).to eq(true)
    end
  end



  context "Price:" do

    it "Product should have price" do
      expect(@product.price.present?).to eq(true)
    end

    it "Product without a price should log error" do
      @category = Category.create(name: 'Apparel')
      @product = @category.products.create({
        name:  'Hipster Hat',
        description: "Test",
        quantity: 10,
        price: nil
      })
      expect(@product.errors.full_messages.present?).to eq(true)
    end
  end

  context "Quantity:" do

    it "Product should have quantity" do
      expect(@product.quantity.present?).to eq(true)
    end

    it "Product without a quantity should log error" do
      @category = Category.create(name: 'Apparel')
      @product = @category.products.create({
        name:  'Hipster Hat',
        description: "Test",
        quantity: nil,
        price: 64.99
      })
      expect(@product.errors.full_messages.present?).to eq(true)
    end
  end

  context "Category:" do

    it "Product should have category" do
      expect(@product.category.present?).to eq(true)
    end

    it "Product without a category should log error" do
      @product = Product.create({
        name:  'Hipster Hat',
        description: "Test",
        quantity: nil,
        price: 64.99,
        category: nil
      })
      expect(@product.errors.full_messages.present?).to eq(true)
    end
  end

end
end
