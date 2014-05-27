package gnk

import org.gnk.rights.RightsService
import org.gnk.user.User

class RightsUserTagLib {
    RightsService rightsService;

    def hasRights = { attrs, body ->
        User user = session.getAttribute("user")
        User currentuser = User.findById(user.id)
        int right = Integer.valueOf(attrs.lvlright)
        if (rightsService.hasRight(currentuser.gright, right))
            out << body()
    }
    def hasRightsRedirect = { attrs, body ->
        User user = session.getAttribute("user") as User
        User currentuser = User.findById(user.id)
        int right = Integer.valueOf(attrs.lvlright)
        if (rightsService.hasRight(currentuser.gright , right))
            out << body()
        else
            response.sendRedirect("../../login/denied")
    }
}