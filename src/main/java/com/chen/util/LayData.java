package com.chen.util;

import java.util.HashMap;
import java.util.List;

/**
 * <Description> <br>
 *
 * @author tao<br>
 * @version 1.0<br>
 * @taskId: <br>
 * @createDate 2019/09/19 16:36 <br>
 * @see com.bdqn.util <br>
 */
public class LayData extends HashMap<String, Object> {

    public static LayData data(Long count, List<?> data){
        LayData r = new LayData();
        r.put("code", 0);
        r.put("msg", "");
        r.put("count", count);
        r.put("data", data);
        return r;
    }

    public static LayData data_upload(Long code,String msg){
        LayData r = new LayData();
        r.put("code", code);
        r.put("msg", msg);
        return r;
    }
}
