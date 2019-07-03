/* eslint no-useless-escape:0 import/prefer-default-export:0 */
const reg = /(((^https?:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+(?::\d+)?|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)$/;

export function isUrl(path) {
  return reg.test(path);
}

export function EnArr2Str(form){
  form.testType=JSON.stringify(form.testType)
  form.testBasis=JSON.stringify(form.testBasis)
  form.testSpecification=JSON.stringify(form.testSpecification)
  form.clientSystem=JSON.stringify(form.clientSystem)
  form.serverHardFrame=JSON.stringify(form.serverHardFrame)
  form.serverSoftFrame=JSON.stringify(form.serverSoftFrame)
  form.checkSample=JSON.stringify(form.checkSample)
  return form
}

export function EnStr2Arr(form){
  form.testType=JSON.parse(form.testType)
  form.testBasis=JSON.parse(form.testBasis)
  form.testSpecification=JSON.parse(form.testSpecification)
  form.clientSystem=JSON.parse(form.clientSystem)
  form.serverHardFrame=JSON.parse(form.serverHardFrame)
  form.serverSoftFrame=JSON.parse(form.serverSoftFrame)
  form.checkSample=JSON.parse(form.checkSample)
  return form
}


