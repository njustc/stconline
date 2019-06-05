import {Card ,Breadcrumb} from 'antd';

export default () => {
	return (
	<div>
	<Breadcrumb>
		<Breadcrumb.Item href="/Welcome.html">主页</Breadcrumb.Item>
		<Breadcrumb.Item>合同详情</Breadcrumb.Item>
	</Breadcrumb>
	<Card>
	<h2>软件委托测试合同</h2>
	</Card>
	<Card>
		<p>项目名称：小猪佩奇测试</p>
		<p>委托方（甲方）：林黛玉</p>
		<p>受托方（乙方）:  NJU</p>
		<p>签订地点：南京大学xxx实验室</p>
		<p>签订日期：2019年16月58日</p>
		<p>本合同由作为委托方的林黛玉（以下简称“甲方”）与作为受托方的南京大学计算机软件新技术国家重点实验室（以下简称“乙方”）在平等自愿的基础上，依据《中华人民共和国合同法》有关规定就项目的执行，经友好协商后订立。</p>
	</Card>
	<Card>
		<h1>一、任务表述</h1>
		<p>乙方按照国家软件质量测试标准和测试规范，完成甲方委托的软件小猪佩奇(下称受测软件)的质量特性随便写点啥吧，进行测试，并出具相应的测试报告。</p>
	</Card>
	<Card>
		<h1>二、双方的主要义务</h1>
		<p>我感觉我随便打字也不会有人发现那我就随便打点字吧最好打多一点这样就没有人会仔细看</p>
	</Card>
	</div>
	);
};