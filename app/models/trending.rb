class Trending < ApplicationRecord
    before_save { self.language = language.downcase }
end
