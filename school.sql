-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema school
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema school
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `school` DEFAULT CHARACTER SET utf8 ;
USE `school` ;

-- -----------------------------------------------------
-- Table `school`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`students` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email_id` VARCHAR(45) NOT NULL,
  `dateRegistered` DATETIME NOT NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`instructor_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`instructor_table` (
  `instructor_id` SMALLINT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`instructor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`courses` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  `price` DECIMAL(9,2) NOT NULL,
  `instructor_table_instructor_id` SMALLINT NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_courses_instructor_table1_idx` (`instructor_table_instructor_id` ASC) VISIBLE,
  CONSTRAINT `fk_courses_instructor_table1`
    FOREIGN KEY (`instructor_table_instructor_id`)
    REFERENCES `school`.`instructor_table` (`instructor_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`enrollments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`enrollments` (
  `students_student_id` INT NOT NULL,
  `courses_course_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `price` DECIMAL(9,2) NOT NULL,
  INDEX `fk_enrollments_students_idx` (`students_student_id` ASC) VISIBLE,
  PRIMARY KEY (`students_student_id`, `courses_course_id`),
  CONSTRAINT `fk_enrollments_students`
    FOREIGN KEY (`students_student_id`)
    REFERENCES `school`.`students` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_enrollments_courses`
    FOREIGN KEY (`courses_course_id`)
    REFERENCES `school`.`courses` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`tags` (
  `tag_id` TINYINT NOT NULL,
  `tag_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tag_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`course_tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`course_tags` (
  `courses_course_id` INT NOT NULL,
  `tags_tag_id` TINYINT NOT NULL,
  INDEX `fk_course_tags_courses1_idx` (`courses_course_id` ASC) VISIBLE,
  INDEX `fk_course_tags_tags1_idx` (`tags_tag_id` ASC) VISIBLE,
  PRIMARY KEY (`courses_course_id`, `tags_tag_id`),
  CONSTRAINT `fk_course_tags_courses`
    FOREIGN KEY (`courses_course_id`)
    REFERENCES `school`.`courses` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_course_tags_tags`
    FOREIGN KEY (`tags_tag_id`)
    REFERENCES `school`.`tags` (`tag_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
