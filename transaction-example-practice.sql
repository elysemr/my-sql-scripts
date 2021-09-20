--Transaction example
--deleting noah fense
--then rolling back and committing and he should still show up in database
--running statement by statement

begin transaction;

delete student where id = 61;
select * from student order by id desc;
--do select to double check you're working in the right parameters
rollback transaction;

commit transaction;