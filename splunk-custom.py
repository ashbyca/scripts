############## CONFIGURATION ########################################################################
'''
The purpose of this custom python code is to create PTR / TRAP Alerts from Splunk Alerts
Step 1:   Upload this code to Main Menu -> Scripts -> ETL Scripts
Step 2:   Create a PTR Scripted Listener Event Source
Step 2a:  Select the script uploaded in Step 1 -> SAVE
Step 2b:  NOTE the POST URL exposed after SAVE... You will need this url for the next step
Step 3:   Configure SPLUNK to send Alerts to the PTR using the POST URL from STEP 2b.
'''
############## jyun@proofpoint.com ##################################################################


import requests
import json
import datetime
import json_sdk

from requests.packages.urllib3.exceptions import InsecureRequestWarning
requests.packages.urllib3.disable_warnings(InsecureRequestWarning)

def create_alert(alert_description,alert_severity,search_name,attacker_ip=None,user_account=None):
    alert=json_sdk.Alert()    
    alert.set_description(alert_description)
    alert.set_severity(alert_severity)
    alert.set_threat_info(json_sdk.ThreatInfo(
        name=search_name,
        threat_type="Splunk Alert",
        occurred_at=datetime.datetime.utcnow().isoformat()+"Z"
    ))
    if attacker_ip!=None:
        alert.set_attacker(json_sdk.Attacker(
        ip_address=attacker_ip
        ))
        alert.add_custom_field('Attacker IP',attacker_ip)
    if user_account!=None:
        alert.set_target(json_sdk.Target(
        user=user_account
        ))
        alert.add_custom_field('User',user_account)
        alert.set_detector(json_sdk.Detector(
        product='SIEM',
        vendor='Splunk'
        ))
    alert.add_custom_field('Summary',search_name)
    return alert

def parse_alert():
    postdata1=ptr.DEVICE_ALERT_DATA
    print(postdata1)
    postdata=json.loads(postdata1)

    try:
        typealert = postdata["search_name"]
        print("typealert: ", typealert)

        if typealert == "CloudTrail Alert: Unauthorized Actions":
            results_link=postdata["results_link"]
            threat_description=postdata["result"]
            alert_description=typealert+"\n"+results_link+"\n "+ json.dumps(threat_description,indent=4)
            alert_severity="high"
            result=create_alert(alert_description=alert_description,alert_severity=alert_severity,search_name=typealert)
            return result

        elif typealert == "Geographically Improbable Access":
            results_link=postdata["results_link"]
            threat_description=postdata["result"]
            alert_description=typealert+"\n"+results_link+"\n "+ json.dumps(threat_description,indent=4)
            alert_severity="high"
            attacker_ip=postdata["result"]["src"]
            result=create_alert(alert_description=alert_description,alert_severity=alert_severity,search_name=typealert,attacker_ip=attacker_ip)
            return result
        
        elif typealert == "Suspected Network Scanning":
            results_link=postdata["results_link"]
            threat_description=postdata["result"]
            alert_description=typealert+"\n"+results_link+"\n "+ json.dumps(threat_description,indent=4)
            alert_severity="low"
            attacker_ip=postdata["result"]["src_ip"]
            result=create_alert(alert_description=alert_description,alert_severity=alert_severity,search_name=typealert,attacker_ip=attacker_ip)
            return result

        elif typealert == "Locked Out Accounts":
            results_link=postdata["results_link"]
            threat_description=postdata["result"]
            alert_description=typealert+"\n"+results_link+"\n "+ json.dumps(threat_description,indent=4)
            alert_severity="low"
            user_account=postdata["result"]["User Account"]
            result=create_alert(alert_description=alert_description,alert_severity=alert_severity,search_name=typealert,user_account=user_account)
            return result
            
        elif typealert == "Okta Detected IP Threat":
            results_link=postdata["results_link"]
            threat_description=postdata["result"]
            alert_description=typealert+"\n"+results_link+"\n "+ json.dumps(threat_description,indent=4)
            alert_severity="low"
            attacker_ip=postdata["result"]["src_ip"]
            result=create_alert(alert_description=alert_description,alert_severity=alert_severity,search_name=typealert,attacker_ip=attacker_ip)
            return result
            
        elif typealert == "CloudTrail Alert: IAM: Create/Delete/Update Access Keys":
            results_link=postdata["results_link"]
            threat_description=postdata["result"]
            alert_description=typealert+"\n"+results_link+"\n "+ json.dumps(threat_description,indent=4)
            alert_severity="high"
            result=create_alert(alert_description=alert_description,alert_severity=alert_severity,search_name=typealert)
            return result
            
        elif typealert == "CloudTrail Alert: Security Groups: Create/Delete Groups":
            results_link=postdata["results_link"]
            threat_description=postdata["result"]
            alert_description=typealert+"\n"+results_link+"\n "+ json.dumps(threat_description,indent=4)
            alert_severity="high"
            result=create_alert(alert_description=alert_description,alert_severity=alert_severity,search_name=typealert)
            return result
            
        elif typealert == "CloudTrail Alert: IAM: Create/Delete Roles":
            results_link=postdata["results_link"]
            threat_description=postdata["result"]
            alert_description=typealert+"\n"+results_link+"\n "+ json.dumps(threat_description,indent=4)
            alert_severity="high"
            result=create_alert(alert_description=alert_description,alert_severity=alert_severity,search_name=typealert)
            return result
            
        elif typealert == "CloudTrail Alert: Key Pairs: Create/Delete/Import Key Pairs":
            results_link=postdata["results_link"]
            threat_description=postdata["result"]
            alert_description=typealert+"\n"+results_link+"\n "+ json.dumps(threat_description,indent=4)
            alert_severity="high"
            result=create_alert(alert_description=alert_description,alert_severity=alert_severity,search_name=typealert)
            return result
        
        elif typealert == "High Number of KTG Requests":
            results_link=postdata["results_link"]
            threat_description=postdata["result"]
            alert_description=typealert+"\n"+results_link+"\n "+ json.dumps(threat_description,indent=4)
            alert_severity="high"
            result=create_alert(alert_description=alert_description,alert_severity=alert_severity,search_name=typealert)
            return result

        else:
            alert_description="NO ALERT MATCH...... "
            alert_severity="low"
            result=create_alert(alert_description=typealert+"\n"+alert_description,alert_severity=alert_severity,search_name=typealert)
            return result
    
    except Exception as e:
        print("Exception:", e)
        print("NO action defined...ignoring")
        return
