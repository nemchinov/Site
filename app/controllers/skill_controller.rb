class SkillController < ApplicationController
  def index
    @skill = Skill.all
    render text: "Skill: <br/>" + @skill.map {|i| "#{i.name}"}.join("<br/>")
  end
  def create
    @skill = Skill.create(name: params[:name])
    render text: "#{@skill.id}: #{@skill.name} (#{!@skill.new_record?})"
    #http://localhost:3000/skill/create?Skill[name]=speed
  end
end
