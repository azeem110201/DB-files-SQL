-- MySQL Workbench Synchronization
-- Generated: 2020-05-22 18:08
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Mohd Azeem

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `school`.`courses` 
DROP FOREIGN KEY `fk_courses_instructor_table1`;

ALTER TABLE `school`.`enrollments` 
DROP FOREIGN KEY `fk_enrollments_courses`;

ALTER TABLE `school`.`course_tags` 
DROP FOREIGN KEY `fk_course_tags_courses`,
DROP FOREIGN KEY `fk_course_tags_tags`;

ALTER TABLE `school`.`enrollments` 
ADD COLUMN `coupon` VARCHAR(45) NULL DEFAULT NULL AFTER `price`,
DROP INDEX `fk_enrollments_courses` ;
;

ALTER TABLE `school`.`courses` 
ADD CONSTRAINT `fk_courses_instructor_table1`
  FOREIGN KEY (`instructor_table_instructor_id`)
  REFERENCES `school`.`instructor_table` (`instructor_id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `school`.`enrollments` 
DROP FOREIGN KEY `fk_enrollments_students`;

ALTER TABLE `school`.`enrollments` ADD CONSTRAINT `fk_enrollments_students`
  FOREIGN KEY (`students_student_id`)
  REFERENCES `school`.`students` (`student_id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_enrollments_courses`
  FOREIGN KEY (`courses_course_id`)
  REFERENCES `school`.`courses` (`course_id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `school`.`course_tags` 
ADD CONSTRAINT `fk_course_tags_courses`
  FOREIGN KEY (`courses_course_id`)
  REFERENCES `school`.`courses` (`course_id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_course_tags_tags`
  FOREIGN KEY (`tags_tag_id`)
  REFERENCES `school`.`tags` (`tag_id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
