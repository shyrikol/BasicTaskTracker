package net.matskevich.taskapp.dao;

import net.matskevich.taskapp.model.Project;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProjectDao extends JpaRepository<Project, Integer> {
}
