package com.vatestar.util;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Enumeration;

/**
 * Created by HarryRen on 2015/3/12.
 */
public class NetUtils {

    private static String localHostIp = null;

    /**
     * 用于获取prefix开头的ip地址
     *
     * @param prefix
     * @return
     */
    public static String getLocalHostIp(String prefix) {
        if (localHostIp != null) {
            return localHostIp;
        } else {
            Enumeration<NetworkInterface> netInterfaces = null;
            try {
                netInterfaces = NetworkInterface.getNetworkInterfaces();
                while (netInterfaces.hasMoreElements()) {
                    NetworkInterface ni = netInterfaces.nextElement();
                    Enumeration<InetAddress> ips = ni.getInetAddresses();
                    while (ips.hasMoreElements()) {
                        String ipStr = ips.nextElement().getHostAddress();
                        if (ipStr.startsWith(prefix)) {
                            localHostIp = ipStr;
                            return ipStr;
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null;
        }
    }
}
