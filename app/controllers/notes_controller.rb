class NotesController < ApplicationController
  def index
    @notes = []
    if current_user
      5.times() do |i|
        @notes.push title: "Note ##{i}", text: 'This is the sample text'
      end
    end
  end
end
