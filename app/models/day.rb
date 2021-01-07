class Day < ActiveHash::Base
  self.date = [

    { id: 1, name: '--' },
    { id: 2, name: '1~2日で配送' },
    { id: 3, name: '2~3日で配送' },
    { id: 3, name: '3~7日で配送' },

  ]
end
