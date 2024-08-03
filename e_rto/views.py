from django.http import HttpResponse,HttpResponseRedirect
from django.shortcuts import render
from django.shortcuts import redirect
from django.urls import reverse
from  django.core.files.storage import FileSystemStorage
import datetime
import pycurl
from urllib.parse import urlencode
from .models import *
import qrcode
from io import BytesIO


def first(request):
    return render(request,'index.html')

def index(request):
    return render(request,'index.html')

def userregister(request):
    return render(request,'userregister.html')

def adduser(request):
    if request.method=='POST':
        name=request.POST.get('name')
        email=request.POST.get('email')
        phone=request.POST.get('phone')
        address=request.POST.get('address')
        dob=request.POST.get('dob')
        password=request.POST.get('password')

        ins=user(name=name,email=email,phone=phone,address=address,dob=dob,password=password)
        ins.save()
    return render(request,'index.html',{'message':'Successfully Registered'})

def policeregister(request):
    return render(request,'policeregister.html')

def addpolice(request):
    if request.method=='POST':
        name=request.POST.get('name')
        email=request.POST.get('email')
        phone=request.POST.get('phone')
        address=request.POST.get('address')
        password=request.POST.get('password')

        ins=police(name=name,email=email,phone=phone,address=address,password=password)
        ins.save()
    return render(request,'index.html',{'message':'Successfully Registered'})

def checkpostregister(request):
    return render(request,'checkpostregister.html')

def addcheckpost(request):
    if request.method=='POST':
        name=request.POST.get('name')
        email=request.POST.get('email')
        phone=request.POST.get('phone')
        address=request.POST.get('address')
        password=request.POST.get('password')

        ins=checkpost(name=name,email=email,phone=phone,address=address,password=password)
        ins.save()
    return render(request,'index.html',{'message':'Successfully Registered'})

def login(request):
    return render(request,'login.html')

def addlogin(request):
    email = request.POST.get('email')
    password = request.POST.get('password')
    if email == 'admin@gmail.com' and password =='admin':
        request.session['logintdetail'] = email
        request.session['rto'] = 'rto'
        return render(request,'index.html')

    elif user.objects.filter(email=email,password=password).exists():
        userdetails=user.objects.get(email=request.POST['email'], password=password)
        if userdetails.password == request.POST['password']:
            request.session['uid'] = userdetails.id
            request.session['uname'] = userdetails.name
            request.session['uemail'] = email

            return render(request,'index.html')

    elif police.objects.filter(email=email,password=password).exists():
        userdetails=police.objects.get(email=request.POST['email'], password=password)
        if userdetails.password == request.POST['password']:
            request.session['pid'] = userdetails.id
            request.session['pname'] = userdetails.name

            request.session['pemail'] = email

            return render(request,'index.html')
        
    elif checkpost.objects.filter(email=email,password=password).exists():
        userdetails=checkpost.objects.get(email=email, password=password)
        if userdetails.password == request.POST['password']:
            request.session['cid'] = userdetails.id
            request.session['cname'] = userdetails.name

            return render(request,'index.html')

    else:
        return render(request, 'login.html', {'message4':'Invalid Email or Password'})
    
def logout(request):
    session_keys = list(request.session.keys())
    for key in session_keys:
        del request.session[key]
    return redirect(first)

def viewusers(request):
    sel=user.objects.all()
    return render(request,'viewusers.html',{'result':sel})

def vehicle(request):
    return render(request,'vehicle.html')

def addvehicle(request):
    if request.method=='POST':
        uid=request.session['uname']
        reg_no=request.POST.get('reg_no')
        ownwer_name=request.POST.get('ownwer_name')
        address=request.POST.get('address')
        cmpny_name=request.POST.get('cmpny_name')
        vehicle_type=request.POST.get('vehicle_type')
        fuel_type=request.POST.get('fuel_type')
        engine_cc=request.POST.get('engine_cc')
        ins_exdate=request.POST.get('ins_exdate')
        pollution_edate=request.POST.get('pollution_edate')
        reg_edate=request.POST.get('reg_edate')
        myfile=request.FILES['ins']
        fs= FileSystemStorage()
        filename=fs.save(myfile.name,myfile)
        myfile1=request.FILES['pollution']
        fs1= FileSystemStorage()
        filename1=fs1.save(myfile1.name,myfile1)

        ins=vehicles(uid=uid,reg_no=reg_no,ownwer_name=ownwer_name,address=address,cmpny_name=cmpny_name,vehicle_type=vehicle_type,fuel_type=fuel_type,engine_cc=engine_cc,ins_exdate=ins_exdate,pollution_edate=pollution_edate,reg_edate=reg_edate,ins=filename,pollution=filename1)
        ins.save()
    return render(request,'index.html',{'message':'Successfully Registered'})

def viewvehicle(request):
    sel=vehicles.objects.all()
    return render(request,'viewvehicle.html',{'result':sel})

def search(request):
    if request.method == "POST":
        reg_no = request.POST.get('reg_no')
        #print(reg_no)
      
        crp = vehicles.objects.filter(reg_no=reg_no)
        return render(request,'viewvehicle.html', {'result': crp})
    else:
        crp = vehicles.objects.all()
        return render(request,'viewvehicle.html', {'result': crp})

def viewvehicle_single(request,id):
    sel=vehicles.objects.get(id=id)
    return render(request,'viewvehicle_single.html',{'result':sel})

def qrgenerate(request, id):
    # Retrieve the object from the database based on the ID
    obj = vehicles.objects.get(id=id)
    
    # Generate the QR code
    qr = qrcode.QRCode(version=1, error_correction=qrcode.constants.ERROR_CORRECT_L, box_size=10, border=4)
    qr_data = f"Registration Number: {obj.reg_no}\nOwner Name: {obj.ownwer_name}\nAddress: {obj.address}\nCompany Name: {obj.cmpny_name}\nVehicle Type: {obj.vehicle_type}\nVehicle Fuel Type: {obj.fuel_type}\nEngine CC: {obj.engine_cc}\nInsurance Expiry Date: {obj.ins_exdate}\nPollution Expiry Date: {obj.pollution_edate}\nRegistration Expiry Date: {obj.reg_edate}"
    qr.add_data(qr_data)  # Example: Generate QR code based on the registration number
    qr.make(fit=True)
    
    # Create a BytesIO object to hold the image data
    img_stream = BytesIO()
    
    # Render the QR code as an image
    img = qr.make_image()
    image_path = f"media/qrcodes/qrcode_{obj.id}.png"
    img.save(image_path, format='PNG')
    img.save(img_stream, 'PNG')
    
    # Set the appropriate headers for the HTTP response
    response = HttpResponse(content_type='image/png')
    response['Content-Disposition'] = f'attachment; filename="qrcode.png"'
    
    # Set the image data as the response content
    response.write(img_stream.getvalue())
    context = {'result': obj}
    return render(request, 'qrview.html', context)


def viewvehicle_checkpost(request):
    sel=vehicles.objects.all()
    return render(request,'viewvehicle_checkpost.html',{'result':sel})

def search1(request):
    if request.method == "POST":
        reg_no = request.POST.get('reg_no')
        #print(reg_no)
      
        crp = vehicles.objects.filter(reg_no=reg_no)
        return render(request,'viewvehicle_checkpost.html', {'result': crp})
    else:
        crp = vehicles.objects.all()
        return render(request,'viewvehicle_checkpost.html', {'result': crp})
    
def fine(request,id):
    sel=vehicles.objects.get(id=id)
    return render(request,'fine.html',{'result':sel})

def addfine(request,id):
    if request.method=='POST': 
        reg_no=request.POST.get('reg_no')
        uid=request.POST.get('uid')
        date=request.POST.get('date')
        reason=request.POST.get('reason')
        amount=request.POST.get('amount')
        checkpost_id=request.session['cname']

        ins=fines(reg_no=reg_no,uid=uid,date=date,reason=reason,amount=amount,checkpost_id=checkpost_id)
        ins.save()
    return render(request,'index.html',{'message5':'Successfully Added Fine'})

def viewfine(request):
    user=request.session['uname']
    sel=fines.objects.filter(uid=user)
    return render(request,'viewfine.html',{'result':sel})

def payfine(request,id):
    sel=fines.objects.get(id=id)
    return render(request,'payfine.html',{'result':sel})

def addfinepayment(request):
    if request.method=='POST':
        reg_no=request.POST.get('reg_no')
        uid=request.session['uname']
        date=request.POST.get('date')
        card_type=request.POST.get('card_type')
        amount=request.POST.get('amount')
        card_name=request.POST.get('card_name')
        card_no=request.POST.get('card_no')
        cvv=request.POST.get('cvv')
        ins=fines_payment(reg_no=reg_no,uid=uid,date=date,card_type=card_type,amount=amount,card_name=card_name,card_no=card_no,cvv=cvv)
        ins.save()
    return render(request,'index.html',{'message4':'Successfully Paid'})

def complaint(request,id):
    sel=vehicles.objects.get(id=id)
    return render(request,'complaint.html',{'result':sel})

def addcomplaint(request):
    if request.method=='POST':
        reg_no=request.POST.get('reg_no')
        uid=request.POST.get('uid')
        date=request.POST.get('date')
        reason=request.POST.get('reason')
        checkpost_id=request.session['cname']

        ins=complaints(reg_no=reg_no,uid=uid,date=date,reason=reason,checkpost_id=checkpost_id)
        ins.save()
    return render(request,'index.html',{'message5':'Successfully Added '})


def viewcmplt(request):
    sel=complaints.objects.all()
    return render(request,'viewcmplt.html',{'result':sel})

def regcomplaint(request):
    sel=complaints.objects.all()
    return render(request,'viewcmplt.html',{'result':sel,'msg':'Registered Successfully'})