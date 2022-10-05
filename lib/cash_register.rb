require 'pry'
class CashRegister

  attr_accessor :total, :discount, :item_total, :items_arr, :transaction_array   

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @item_total = item_total
    @items_arr = []
    @transaction_array = []
  end  
  
  def add_item(title, price, quantity = 1)
    @total = @total + (price * quantity)
    self.item_total = price * quantity
    new_hash = {}
    new_hash[:title] = title
    new_hash[:item_total] = self.item_total
    self.transaction_array << new_hash
    # if quantity == 1
    #   self.item(title, price)
    # else  
    self.items(title, price, quantity)
    # if quantity == 1
    #   self.items_arr << title
    # else 
    #   counter = 0
    #   while counter < quantity
    #     self.items_arr << title
    #     counter += 1
    #   end  
    # end
  end 
  
  def apply_discount 
    if self.discount == 0
        "There is no discount to apply."
      else
        discount_amt = self.item_total * self.discount / 100
        discount_amt.to_f
        self.item_total -= discount_amt
        @total -= discount_amt
        "After the discount, the total comes to $#{self.item_total}."   
      end 
  end

  def items(title, price, quantity = 1)
    if quantity == 1
      self.items_arr << title
    else 
      counter = 0
      while counter < quantity
        self.items_arr << title
        counter += 1
      end  
    end
    self.items_arr  
  end

  def void_last_transaction
    last_item = self.transaction_array.last
    self.total -= last_item[:item_total]
    self.transaction_array.pop
    self.total
  end   
end  


# c1 = CashRegister.new
# cjf = c1.add_item("ipod", 1000)
# binding.pry
# cjf = c1.add_item("broccoli", 2.15, 4)
# binding.pry
# cjf = c1.add_item("macbook air", 1000)
# cjf = c1.add_item("ipad", 600)
# cjf = c1.add_item("earpods", 200)
# binding.pry
# ann = c1.void_last_transaction
# binding.pry
# ann = c1.void_last_transaction
# binding.pry
# ann = c1.void_last_transaction
# binding.pry

# const updatedVineyards = vineyards.map(vineyard => {vineyard.id === newWineObj.vineyard_id ? {...vineyard.wines[...vineyard.wines, newWineObj]} : vineyard}) 
