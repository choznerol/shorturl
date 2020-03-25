class Mapping < ApplicationRecord
  # Check presence before checking regex
  # Ref: https://stackoverflow.com/a/24659037/6739302
  validates :target_url, presence: true
  validates :target_url, format: { with: URI::regexp(%w(http https)), message: 'Valid URL required'}

  # TODO: This probably doesn't work under an actual concurrent environment[1].
  #       Uniqueness is actually guaranteed by unique index in DB, which won't
  #       fail gracefully like ActiveRecord errors.
  #       Catch and handle such DB error later.
  #
  # ref: https://github.com/trptcolin/consistency_fail#description
  validates_uniqueness_of :key
  validates :key, presence: true, length: { minimum: 2, maximum: 10 }

  before_validation :set_key

  # Replaceable logic of calculating next key to use

  # Current implementation:
  # A hexadecimal representation of (Previous ID + 16)
  # The purpose of `+ 16` is to ensure there are at least 2 digits in the
  # hexadecimal representation
  def self.next_key
    next_id = (Mapping.maximum(:id)&.next || 0)
    (next_id + 16).to_s(16)
  end

  private

  def set_key
    return unless new_record?

    self.key = Mapping.next_key
  end
end
