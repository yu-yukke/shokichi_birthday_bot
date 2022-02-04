class HomeController < ApplicationController
  def index
    @subject = Subject.new
    @conjunction = Conjunction.new
    @predicate = Predicate.new

    @subjects = Subject.all.order(name: :asc)
    @conjunctions = Conjunction.all.order(name: :asc)
    @predicates = Predicate.all.order(name: :asc)
  end
end
