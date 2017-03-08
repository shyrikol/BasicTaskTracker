package net.matskevich.taskapp.dao;

import net.matskevich.taskapp.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleDao extends JpaRepository<Role, Long> {
}
