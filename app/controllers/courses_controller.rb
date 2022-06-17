class CoursesController < ApplicationController
    def allshow
        @courses = Course.all
    end   
end