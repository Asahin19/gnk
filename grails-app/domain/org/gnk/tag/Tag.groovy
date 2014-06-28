package org.gnk.tag

class Tag {

    Integer id
    Integer version

    Date lastUpdated
    Date dateCreated
    String name
    Tag parent

    static hasMany = [parentId: Tag]

    static constraints = {
        name maxSize: 45
    }

    @Override
    public String toString() {
        return name;
    }

    static mapping = {
        id type: 'integer'
        version type: 'integer'
    }

    String getterName() {
        return name;
    }
}
