public class Line_Builder{
    private static final String JSON_EVENT = 'events';
    private static final String JSON_TO = 'to';
    private static final String JSON_MESSAGES = 'messages';
    private static final String JSON_TYPE = 'type';
    private static final String JSON_ALTTEXT = 'altText';
    private static final String JSON_TEMPLATE = 'template';
    private static final String JSON_COLUMNS = 'columns';
    private static final String JSON_THUMBNAILIMAGEURL = 'thumbnailImageUrl';
    private static final String JSON_TITLE = 'title';
    private static final String JSON_LABEL = 'label';
    private static final String JSON_DATA = 'data';
    private static final String JSON_TEXT = 'text';
    private static final String JSON_IMAGE = 'image';
    private static final String JSON_ORIGINALCONTENTURL = 'originalContentUrl';
    private static final String JSON_PREVIEWIMAGEURL = 'previewImageUrl';
    private static final String JSON_VIDEO = 'video';
    private static final String JSON_AUDIO = 'audio';
    private static final String JSON_DURATION = 'duration';
    private static final String JSON_LOCATION = 'location';
    private static final String JSON_ADDRESS = 'address';
    private static final String JSON_LATITUDE = 'latitude';
    private static final String JSON_LONGITUDE = 'longitude';
    private static final String JSON_STICKER = 'sticker';
    private static final String JSON_PACKAGEID = 'packageId';
    private static final String JSON_STICKERID = 'stickerId';
    private static final String JSON_IMAGEMAP = 'imagemap';
    private static final String JSON_BASEURL = 'baseUrl';   
    private static final String JSON_ACTIONS = 'actions';
    private static final String JSON_BASESIZE = 'baseSize';
    private static final String JSON_HEIGHT = 'height';
    private static final String JSON_WIDTH = 'width';
    private static final String JSON_AREA = 'area';
    private static final String JSON_X = 'x'; 
    private static final String JSON_Y = 'y';
    private static final String JSON_LINKURI = 'linkUri';
   
    
    private static final String JSON_REPLYTOKEN = 'replyToken';
    private static final String JSON_TIMESTAMP = 'timestamp';
    private static final String JSON_SOURCE = 'source';
    private static final String JSON_USERID = 'userId';
    private static final String JSON_DISPLAYNAME = 'displayName';
    private static final String JSON_PICTUREURL = 'pictureUrl';
    private static final String JSON_STATUSMESSAGE = 'statusMessage';


    private static final String SOURCE_TYPE_USER = 'user';
    private static final String ACTION_TYPE_POSTBACK = 'postback';
    private static final String ACTION_TYPE_URI = 'uri';
    private static final String TEMPLATE_TYPE_BUTTONS = 'buttons';
    private static final String TEMPLATE_TYPE_CAROUSEL = 'carousel';
    private static final String EVENT_TYPE_FOLLOW = 'follow';
    

    private static JSONGenerator buildPostbackActionJson(JSONGenerator gen, Line_PostbackAction action){
            gen.writeStartObject();
            gen.writeStringField(JSON_TYPE, action.getType());
            gen.writeStringField(JSON_LABEL, action.getLabel());
            gen.writeStringField(JSON_DATA, action.getData());
            gen.writeEndObject();    
            return gen;
    }

    private static JSONGenerator buildActionsArrayJson(JSONGenerator gen, List<Line_Action> actions){
        gen.writeFieldName(JSON_ACTIONS);
        gen.writeStartArray();
        for(Line_Action action : actions){
            String type = action.getType();
            if(type.equals(ACTION_TYPE_POSTBACK)){
                gen = buildPostbackActionJson(gen, (Line_PostbackAction)action);
            }
        }
        gen.writeEndArray();
        return gen;
    }


    private static JSONGenerator buildColumnJson(JSONGenerator gen, Line_Column column){
            gen.writeStartObject();
            gen.writeStringField(JSON_THUMBNAILIMAGEURL, column.getThumbnailImageUrl());
            gen.writeStringField(JSON_TITLE, column.getTitle());
            gen.writeStringField(JSON_TEXT, column.getText());
            gen = buildActionsArrayJson(gen, column.getActions());
            gen.writeEndObject();
            return gen;
    }

    private static JSONGenerator buildCarouselTemplateJson(JSONGenerator gen, Line_CarouselTemplate template){
        gen.writeFieldName(JSON_COLUMNS);
        gen.writeStartArray();
        for(Line_Column column : template.getColumns()){
            gen = buildColumnJson(gen, column);
        }
        gen.writeEndArray();
        return gen;
    }
    private static JSONGenerator buildButtonsTemplateJson(JSONGenerator gen, Line_ButtonsTemplate template){
        gen.writeStringField(JSON_THUMBNAILIMAGEURL, template.getThumbnailImageUrl());
        gen.writeStringField(JSON_TITLE, template.getTitle());
        gen.writeStringField(JSON_TEXT, template.getTitle());
        gen = buildActionsArrayJson(gen, template.getActions());    
        return gen;
    }
    private static JSONGenerator buildTemplateJson(JSONGenerator gen, Line_Template template){
        gen.writeStartObject();       
        gen.writeStringField(JSON_TYPE, template.getType());
        String type = template.getType();
        if(type.equals(TEMPLATE_TYPE_BUTTONS)){
            gen = buildButtonsTemplateJson(gen, (Line_ButtonsTemplate)template);
        }else if(type.equals(TEMPLATE_TYPE_CAROUSEL)){
            gen = buildCarouselTemplateJson(gen, (Line_CarouselTemplate)template);
        }
        gen.writeEndObject();
        return gen;
    }

    private static JSONGenerator buildBaseSizeJson(JSONGenerator gen, Line_ImagemapBaseSize baseSize){
        gen.writeFieldName(JSON_BASESIZE);
        gen.writeStartObject();
        gen.writeNumberField(JSON_HEIGHT, baseSize.getHeight());
        gen.writeNumberField(JSON_WIDTH, baseSize.getWidth());
        gen.writeEndObject();
        return gen;
    }
    private static JSONGenerator buildImageMapActionsAreaJson(JSONGenerator gen, Line_ImageMapArea mapArea){
        gen.writeFieldName(JSON_AREA);
        gen.writeStartObject();
        gen.writeNumberField(JSON_X, mapArea.getX());
        gen.writeNumberField(JSON_Y, mapArea.getY());
        gen.writeNumberField(JSON_WIDTH, mapArea.getHeight());
        gen.writeNumberField(JSON_HEIGHT, mapArea.getWidth());
        gen.writeEndObject();
        return gen;
    }

    private static JSONGenerator buildImageMapActionsJson(JSONGenerator gen, List<Line_ImageMapAction> actions){
        gen.writeFieldName(JSON_ACTIONS);
        gen.writeStartArray();
        for(Line_ImageMapAction action : actions){
            gen.writeStartObject();
            gen.writeStringField(JSON_TYPE, action.getType());
            if(action.getType().equals(ACTION_TYPE_URI)){
                Line_UriImageMapAction uriAction = (Line_UriImageMapAction)action;
                gen.writeStringField(JSON_LINKURI, uriAction.getLinkUri()); 
            }else{
                Line_MessageImageMapAction messageAction = (Line_MessageImageMapAction)action;
                gen.writeStringField(JSON_TEXT, messageAction.getText());             
            }
            gen = buildImageMapActionsAreaJson(gen, action.getImageMapArea());
            gen.writeEndObject();
        }
        gen.writeEndArray();
        return gen;
    }

    private static JSONGenerator buildMessageJson(JSONGenerator gen, Line_Message message){
        gen.writeStartObject();
        String type = message.getType();
        gen.writeStringField(JSON_TYPE, type);
        if(type.equals(JSON_TEMPLATE)){
            Line_TemplateMessage templateMessage = (Line_TemplateMessage)message;
            gen.writeStringField(JSON_ALTTEXT, templateMessage.getAltText());
            gen.writeFieldName(JSON_TEMPLATE);
            gen = buildTemplateJson(gen, templateMessage.getTemplate());
        }else if(type.equals(JSON_TEXT)){
            Line_TextMessage textMessage = (Line_TextMessage)message;
            gen.writeStringField(JSON_TEXT, textMessage.getText());
        }else if(type.equals(JSON_IMAGE)){
            Line_ImageMessage imageMessage = (Line_ImageMessage)message;
            gen.writeStringField(JSON_ORIGINALCONTENTURL, imageMessage.getOriginalContentUrl());
            gen.writeStringField(JSON_PREVIEWIMAGEURL, imageMessage.getPreviewImageUrl());    
        }else if(type.equals(JSON_VIDEO)){
            Line_VideoMessage videoMessage = (Line_VideoMessage)message;
            gen.writeStringField(JSON_ORIGINALCONTENTURL, videoMessage.getOriginalContentUrl());
            gen.writeStringField(JSON_PREVIEWIMAGEURL, videoMessage.getPreviewImageUrl());    
        }else if(type.equals(JSON_AUDIO)){
            Line_AudioMessage audioMessage = (Line_AudioMessage)message;
            gen.writeStringField(JSON_ORIGINALCONTENTURL, audioMessage.getOriginalContentUrl());
            gen.writeNumberField(JSON_DURATION, audioMessage.getDuration());    
        }else if(type.equals(JSON_LOCATION)){
            Line_LocationMessage locationMessage = (Line_LocationMessage)message;
            gen.writeStringField(JSON_TITLE, locationMessage.getTitle());
            gen.writeStringField(JSON_ADDRESS, locationMessage.getAddress());
            gen.writeNumberField(JSON_LATITUDE, locationMessage.getLatitude());
            gen.writeNumberField(JSON_LONGITUDE, locationMessage.getLongitude());
        }else if(type.equals(JSON_STICKER)){
            Line_StickerMessage stickerMessage = (Line_StickerMessage)message;
            gen.writeStringField(JSON_PACKAGEID, stickerMessage.getPackageId());
            gen.writeStringField(JSON_STICKERID, stickerMessage.getStickerId());
        }else if(type.equals(JSON_IMAGEMAP)){
            Line_ImageMapMessage imageMapMessage = (Line_ImageMapMessage)message;
            gen.writeStringField(JSON_BASEURL, imageMapMessage.getBaseUrl());
            gen.writeStringField(JSON_ALTTEXT, imageMapMessage.getAltText());
            gen = buildBaseSizeJson(gen, imageMapMessage.getBaseSize());
            gen = buildImageMapActionsJson(gen, imageMapMessage.getActions());
        }
        gen.writeEndObject();
        return gen;
    }
    public static String buildPushMessageJson(Line_PushMessage pushMessage){
        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();
        gen.writeStringField(JSON_TO, pushMessage.getTo());
        gen.writeFieldName(JSON_MESSAGES);
        gen.writeStartArray();
        for(Line_Message message : pushMessage.getMessages()){
            gen = buildMessageJson(gen, message);
        }
        gen.writeEndArray();
        gen.writeEndObject();
        return gen.getAsString();
    }


    public static List<Line_Event> deserializeEvents(String jsonStr){
        List<Line_Event> events = new List<Line_Event>();
        Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(jsonStr);
        for(Object resultObj : (List<Object>)m.get(JSON_EVENT)){
            events.add( buildEvent((Map<String, Object>)resultObj) );
        }    
        return events;
    }
    
    public static Line_UserProfile deserializeUserProfile(String jsonStr){
        Map<String, Object> objMap = (Map<String, Object>)JSON.deserializeUntyped(jsonStr);
        String displayName = (String)objMap.get(JSON_DISPLAYNAME);
        String userId = (String)objMap.get(JSON_USERID);
        String pictureUrl = (String)objMap.get(JSON_PICTUREURL);
        String statusMessage = (String)objMap.get(JSON_STATUSMESSAGE);
        return new Line_UserProfile(displayName, userId, pictureUrl, statusMessage);    

    }


    private static Line_Source buildSource(Map<String, Object> objMap){
        String type = (String)objMap.get(JSON_TYPE);            
        if(type.equals(SOURCE_TYPE_USER)){
            return new Line_UserSource((String)objMap.get(JSON_USERID));
        }    
        return null;
    }
    
    public static Line_Event buildEvent(Map<String, Object> objMap){
            String type = (String)objMap.get(JSON_TYPE);
            if(type.equals(EVENT_TYPE_FOLLOW)){
                String replyToken = (String)objMap.get(JSON_REPLYTOKEN); 
                DateTime timestamp = DateTime.newInstance( (Long)objMap.get(JSON_TIMESTAMP) );
                Line_Source source = buildSource((Map<String, Object>)objMap.get(JSON_SOURCE));
                return new Line_FollowEvent(replyToken, timestamp, source);                
            }

            return null;
    }
}