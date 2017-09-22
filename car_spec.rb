require './car.rb'
describe Car do
  it 'should be able to store name and color' do
    c = Car.new('KA 01 EA 0001', 'Black')
    expect(c.color).to eq('Black')
    expect(c.name).to eq('KA 01 EA 0001')
  end
end
