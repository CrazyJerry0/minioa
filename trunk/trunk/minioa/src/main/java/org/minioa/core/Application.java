package org.minioa.core;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.faces.model.SelectItem;

import org.hibernate.Query;
import org.jboss.seam.ui.HibernateEntityLoader;

public class Application {

	public List<String> userList;
	public List<SelectItem> userSelectItem;

	public List<String> getUserList() {
		if (userList == null)
			buildUserList();
		return userList;
	}

	public List<SelectItem> getUserSelectItem() {
		if (userSelectItem == null)
			buildUserList();
		return userSelectItem;
	}

	public void buildUserList() {
		userList = new ArrayList<String>();
		userSelectItem = new ArrayList<SelectItem>();
		try {
			Query query = new HibernateEntityLoader().getSession().getNamedQuery("core.user.getuserlist");
			Iterator<?> it = query.list().iterator();
			while (it.hasNext()) {
				Object obj[] = (Object[]) it.next();
				userList.add(FunctionLib.getString(obj[1]));
				userSelectItem.add(new SelectItem(FunctionLib.getInt(obj[0]), FunctionLib.getString(obj[2])));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public List<String> roleList;
	public List<SelectItem> roleSelectItem;

	public List<String> getRoleList() {
		if (roleList == null)
			buildRoleList();
		return roleList;
	}

	public List<SelectItem> getRoleSelectItem() {
		if (roleSelectItem == null)
			buildRoleList();
		return roleSelectItem;
	}

	public void buildRoleList() {
		roleList = new ArrayList<String>();
		roleSelectItem = new ArrayList<SelectItem>();
		try {
			Query query = new HibernateEntityLoader().getSession().getNamedQuery("core.role.getrolelist");
			Iterator<?> it = query.list().iterator();
			while (it.hasNext()) {
				Object obj[] = (Object[]) it.next();
				roleList.add(FunctionLib.getString(obj[1]));
				roleSelectItem.add(new SelectItem(FunctionLib.getInt(obj[0]), FunctionLib.getString(obj[2])));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public Map<String, List<String>> bs;
	public Map<String, List<SelectItem>> bsi;

	public Map<String, List<SelectItem>> getBsi() {
		if (bsi == null)
			buildBasicdataList();
		return bsi;
	}

	public Map<String, List<String>> getbs() {
		if (bs == null)
			buildBasicdataList();
		return bs;
	}

	public void buildBasicdataList() {
		bs = new HashMap<String, List<String>>();
		bsi = new HashMap<String, List<SelectItem>>();
		try {
			String name, tempName, value, value2;
			Query query = new HibernateEntityLoader().getSession().getNamedQuery("core.basicdata.records.list");
			Iterator<?> it = query.list().iterator();
			tempName = "";
			ArrayList<String> s = new ArrayList<String>();
			ArrayList<SelectItem> si = new ArrayList<SelectItem>();
			int i = 0;
			while (it.hasNext()) {
				name = value = value2 = "";
				Object obj[] = (Object[]) it.next();
				if (obj[0] != null)
					name = String.valueOf(obj[0]);
				if (obj[1] != null)
					value = String.valueOf(obj[1]);
				if (obj[2] != null)
					value2 = String.valueOf(obj[2]);
				if (tempName.equals(""))
					tempName = name;
				else {
					if (!tempName.equals(name)) {
						bs.put(tempName, s);
						bsi.put(tempName, si);
						s = new ArrayList<String>();
						si = new ArrayList<SelectItem>();
						tempName = name;
					}
				}
				s.add(value);
				si.add(new SelectItem(value2, value));
				i++;
			}
			if (i > 0) {
				bs.put(tempName, s);
				bsi.put(tempName, si);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}