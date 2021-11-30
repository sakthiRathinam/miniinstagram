import datetime
from django.utils.timesince import timesince
from typing import Optional
from django.db.models.base import ModelBase
def get_timeleft(date:Optional[datetime.datetime]=None,datetime:Optional[datetime.date]=None) -> str:
    if date is not None:
        now = datetime.date.today()
    else:
        now = datetime.datetime.now()
    date_obj = date
    left=timesince(now,date_obj)+" "+"left"
    if left[0]=="0" and left[2]=="m":
        return "time expired"
    return left
    


def get_timebefore(date:Optional[datetime.datetime]=None,datetime:Optional[datetime.date]=None) -> str:
    if date is not None:
        now = datetime.date.today()
    else:
        now = datetime.datetime.now()
    date_obj = date
    posted_ago=timesince(date_obj,now)+" "+"posted ago"
    return left

def api_view_pagination(model:ModelBase,filter:Optional[dict]={},exculde:Optional[dict]={},limit:Optional[int]=10,offset:Optional[int]=10) -> dict:
    total_count = model.objects.filter(**filter).count()
    to_send = {
        "total_count": total_count,
        "next": True if limit + offset < total_count else False,
        "prev": True if offset > 0 else False,
        "queryset": model.objects.filter(**filter)[limit:offset+limit], 
    }
    return to_send