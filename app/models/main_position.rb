class MainPosition < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '投手' },
    { id: 2, name: '捕手' },
    { id: 3, name: '内野手' },
    { id: 4, name: '外野手' },
    { id: 5, name: 'スタッフ' }
  ]
end
