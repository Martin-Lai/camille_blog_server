module BasicConcern
  extend ActiveSupport::Concern
  included do
    def self.transfer_to_array_with_hash(except_columns = [false])
      array_with_hash = self.all.to_a.map(&:serializable_hash).map(&:symbolize_keys)
      array_with_hash.map!{|s| s.except(*except_columns)} if except_columns.present?
      array_with_hash
    end
    
    def transfer_to_hash(except_columns=[])
      hash = self.serializable_hash.symbolize_keys
      hash.except!(*except_columns) if except_columns.present?
      hash
    end
  end
end