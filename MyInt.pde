public class MyInt {
  int val;
  public MyInt(int num) { 
    this.val = num;
  }

  public MyInt inc() { 
    val++; 
    return this;
  } 
  public MyInt add(int num) { 
    this.val+=num; 
    return this;
  }
  //public MyInt dec() { 
  //  val--;
  //  return this;
  //}

  //public MyInt sub(int num) { 
  //  this.val-=num; 
  //  return this;
  //}
  //public MyInt add(MyInt obj) { 
  //  this.val+=obj.val; 
  //  return this;
  //}
  //public MyInt sub(MyInt obj) { 
  //  this.val-=obj.val; 
  //  return this;
  //}
  //public MyInt mul(int num) { 
  //  this.val*=num; 
  //  return this;
  //}
  //public MyInt div(int num) { 
  //  this.val/=num; 
  //  return this;
  //}
  //public MyInt mul(MyInt obj) { 
  //  this.val*=obj.val; 
  //  return this;
  //}
  //public MyInt div(MyInt obj) { 
  //  this.val/=obj.val; 
  //  return this;
  //}
  //public String toString(){
  //  return "" + val;
  //}
}
