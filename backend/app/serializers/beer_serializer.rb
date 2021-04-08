class BeerSerializer < ActiveModel::Serializer 
    attributes :name, :malt_type, :malt_amount, :hop_type, :hop_amount, :yeast_type, :yeast_amount, :water_ph, :water_amount, :user_id, :id
end