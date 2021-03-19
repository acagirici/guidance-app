module StudentsHelper

    def index_display_header
        if @user
          content_tag(:h1, "#{@user.username}'s Students:")
        else
          content_tag(:h2, "All Students")
        end
      end

    def display_students
        if @user.students.empty?
            tag.h3(link_to('No Students, Create Here', new_student_path))
        else
            user = @user == current_user ? 'Your' : "#{@user.username}'s"
            content_tag(:h3, "#{user} #{pluralize(@user.students.count, 'Student')}:")
        end
    end
end
