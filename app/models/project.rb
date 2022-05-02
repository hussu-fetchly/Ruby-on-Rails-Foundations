class Project < ApplicationRecord
    after_initialize :set_defaults
    validates_presence_of :title, :description
    has_many :tasks

    # what to put on models
    # custom scopes
    # add defaults
    # integrate validations
    # integrate callbacks
    # integrate database relationships

    scope :almost_completed, -> { where('percent_complete > 75.0 ')}

    def set_defaults
        self.percent_complete ||= 0.0
    end

end
