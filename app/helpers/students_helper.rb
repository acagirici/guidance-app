module StudentsHelper
    def display_students
        if @user.students.empty?
            tag.h3(link_to('No Students, Create Here', new_student_path))
        else
            user = @user == current_user ? 'Your' : "#{@user.username}'s"
            content_tag(:h3, "#{user} #{pluralize(@user.students.count, 'Student')}:")
        end
    end
end
