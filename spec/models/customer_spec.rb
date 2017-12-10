require 'rails_helper'

RSpec.describe Customer, type: :model do
  # fixtures :customers

  it '#full_name' do
    #customer = customers(:fernando)
    customer = create(:customer) # create(:user) é possível usar 'user' por causa do alias na factory
    expect(customer.id).not_to eq nil
    expect(customer.full_name).to start_with 'sr.'

    puts customer.email
  end

  it '#full_name - Sobrescrevendo Atributo' do
    customer = create(:customer, name: 'Fernando Oliveira')
    expect(customer.full_name).to eq 'sr. Fernando Oliveira'
  end

  it '#full_name - Sobrescrevendo Atributos' do
    customer = create(:customer_vip)
    expect(customer.full_name).to start_with 'sr.'
    expect(customer.vip).to eq true
    expect(customer.days_to_pay).to eq 30
  end

  it 'usando o attributes_for' do
    attrs = attributes_for(:customer)
    attrs1 = attributes_for(:customer_vip)
    attrs2 = attributes_for(:customer_default)

    puts attrs
    puts attrs1
    puts attrs2

    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with 'sr. '
  end

  it 'Atributo transitório' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq customer.name
  end

  it 'Cliente Masculino' do
    customer = create(:customer_vip, :male)
    expect(customer.gender).to eq 'M'
    expect(customer.vip).to eq true
  end

  it { expect{ create(:customer) }.to change { Customer.count }.by(1) }
end
