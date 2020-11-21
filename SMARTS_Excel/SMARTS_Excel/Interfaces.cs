using System;
using System.Collections.Generic;
using System.Collections;
using System.Text;

namespace SMARTS_Excel
{
    interface IAttribute
    {
        int attributeId { get;set;}

        int createAttribute();
        void deleteAttribute();
    }

    interface IItemTypeAttribute
    {
        int itemTypeId { get;set;}
        int attributeId { get;set;}
        string description { get;set;}
    }

    interface IItemType
    {
        string name { get;set;}
        string description { get;set;}
        global::System.Collections.IEnumerable attributes();

        int addAttribute(); // should these be here or on IItemTypeAttribute?
        void removeAttribute();
    }
    
    interface IItem : IItemType
    {
        int id { get;set;}
        int typeId {get ; set;}
        string name { get;set;}
        string description { get;set;}
        int lifecycleId { get; set;}

        global::System.Collections.IEnumerable attributes();
        int create();
        void delete(); 
    }

    interface IShape : IItem
    {
        // Not sure what else a shape would add

    }

    interface IContainer
    {
        void add(IItem item);
        void remove(IItem item);

        // Perhaps this should be IEnumerator instead of IEnumerable
        global::System.Collections.IEnumerable contains(); // List of items/shapes inside container
        bool canContain();//maybe IItem);
    }

    interface IContainable
    {
        global::System.Collections.IEnumerable containableBy(); // List of items/shapes that can contain this item
    }

    interface ISecurable
    {
    }
}
