def links(context):
    content = context.content
    return [{
              'link_class':"gl-link-{}".format(item.id),
              'url':item.absolute_url(),
              'title':item.title
    } for item in 
              content.listFolderContents(
                      contentFilter={"portal_type" : "Folder"}
                      )]
    