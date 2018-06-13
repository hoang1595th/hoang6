package Com.IFI.InternalTool.DS.DAO;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import Com.IFI.InternalTool.DS.Model.Roles;
import Com.IFI.InternalTool.DS.Model.RoleName;

import java.util.Optional;

@Repository
public interface RoleDAO extends JpaRepository<Roles, Long> {
    Optional<Roles> findByName(RoleName roleName);
    
}